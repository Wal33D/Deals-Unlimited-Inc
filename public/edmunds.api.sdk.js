
window.console = window.console || {};
window.console.log = this.console.log || function() {};


function EDMUNDSAPI(key) {
	

	var _version = "0.1.7";

	var _api_key = key;

	if (window.location.protocol == "http:" || window.location.protocol == "https:") {
		var _base_url = window.location.protocol + "//api.edmunds.com";
	}
	else {
		var _base_url = "http://api.edmunds.com";
	}
	

	var _base_media = window.location.protocol + "//media.ed.edmunds-media.com";
	
	
	var _response_format = 'json';
	

	this.setOutput = function(format) {
		_response_format = format;
		return _response_format;
	};


	function _serializeParams(params) {
		var str = '';
		for(var key in params) {
			if(params.hasOwnProperty(key)) {
				if (str !== '') str += "&";
		   		str += key + "=" + params[key];
			}
		}
		return str;
	}


	this.getBaseUrl = function() {
		return _base_url;
	};
	
	
	this.getBaseMediaUrl = function() {
		return _base_media;
	};
	
	this.api = function(method, params, successCallback, errorCallback) {
        var queryString = _serializeParams(params),
            baseUrl = this.getBaseUrl();
        queryString = (queryString) ? '?' + queryString + '&api_key=' + _api_key + "&fmt=" + _response_format : '?api_key=' + _api_key + "&fmt=" + _response_format;
        return this.jsonp({
            url: baseUrl + method + queryString,
            timeout: 7000,
            success: successCallback,
            error: errorCallback,
			cache: true
        });
	};
	
	this.jsonp = (function(global) {
	    'use strict';

	    var callbackId = 0,
	        documentHead = document.head || document.getElementsByTagName('head')[0];

	    function createScript(url) {
	        var script = document.createElement('script');
	        script.setAttribute('type', 'text/javascript');
	        script.setAttribute('async', true);
	        script.setAttribute('src', url);
	        return script;
	    }

	    return function(options) {
	        options = options || {};

	        var callbackName = 'callback' + (new Date().getTime())+ (++callbackId),
	            url = options.url + '&callback=' + callbackName + (options.cache ? '' : '&_dc=' + new Date().getTime()),
	            script = createScript(url),
	            abortTimeout;

	        function cleanup() {
	            if (script) {
	                script.parentNode.removeChild(script);
	            }
	            clearTimeout(abortTimeout);
	            delete global[callbackName];
	        }

	        function success(data) {
	            if (typeof options.success === 'function') {
	                options.success(data);
	            }
	        }

	        function error(errorType) {
	            if (typeof options.error === 'function') {
	                options.error(errorType);
	            }
	        }

	        function abort(errorType) {
	            cleanup();
	            if (errorType === 'timeout') {
	                global[callbackName] = function() {};
	            }
	            error(errorType);
				window.console.log(errorType+": One of the scripts failed to load ("+callbackName+")");
	        }

	        global[callbackName] = function(data) {
	            cleanup();
	            success(data);
	        };

	        script.onerror = function(e) {
	            abort(e);
	        };

	        documentHead.appendChild(script);

	        if (options.timeout > 0) {
	            abortTimeout = setTimeout(function() {
	                abort('timeout');
	            }, options.timeout);
	        }

	    };

	}(window));
}

if (typeof window.sdkAsyncInit === "function") {
	sdkAsyncInit();
}
