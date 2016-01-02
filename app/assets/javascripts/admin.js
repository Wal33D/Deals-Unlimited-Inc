(function(w, d, s, g, js, fs) {
    g = w.gapi || (w.gapi = {});
    g.analytics = {
        q: [],
        ready: function(f) {
            this.q.push(f);
        }
    };
    js = d.createElement(s);
    fs = d.getElementsByTagName(s)[0];
    js.src = 'https://apis.google.com/js/platform.js';
    fs.parentNode.insertBefore(js, fs);
    js.onload = function() {
        g.load('analytics');
    };
}(window, document, 'script')); 
    gapi.analytics.ready(function() {
        gapi.analytics.auth.authorize({
            container: 'embed-api-auth-container',
            clientid: '563220505800-3laqqiu7ho2jhbotinf0vdb1bhq20dmm.apps.googleusercontent.com'
        });
        var viewSelector = new gapi.analytics.ViewSelector({
            container: 'view-selector-container'
        });
        var viewSelector2 = new gapi.analytics.ViewSelector({
            container: 'view-selector-2-container'
        });
         var viewSelector3 = new gapi.analytics.ViewSelector({
            container: 'view-selector-3-container'
        });
        viewSelector.execute();
        viewSelector2.execute();
        viewSelector3.execute();

        var dataChart = new gapi.analytics.googleCharts.DataChart({
            query: {
                metrics: 'ga:sessions',
                dimensions: 'ga:date',
                'start-date': '30daysAgo',
                'end-date': 'yesterday'
            },
            chart: {
                container: 'chart-container',
                type: 'LINE',
                options: {
                    width: '100%'
                }
            }
        });

        var dataChart2 = new gapi.analytics.googleCharts.DataChart({
            query: {
                metrics: 'ga:sessions',
                dimensions: 'ga:country',
                'start-date': '30daysAgo',
                'end-date': 'yesterday',
                'max-results': 8,
                sort: '-ga:sessions'
            },
            chart: {
                container: 'chart-2-container',
                type: 'BAR',
                options: {
                    width: '100%',
                }
            }
        });
         var dataChart3 = new gapi.analytics.googleCharts.DataChart({
            query: {
                metrics: 'ga:sessions',
                dimensions: 'ga:city',
                'start-date': '30daysAgo',
                'end-date': 'yesterday',
                'max-results': 8,
                sort: '-ga:sessions'
            },
            chart: {
                container: 'chart-3-container',
                type: 'PIE',
                options: {
                    width: '100%',
                     pieHole: 4 / 9
                }
            }
        });
        viewSelector.on('change', function(ids) {
            dataChart.set({
                query: {
                    ids: ids
                }
            }).execute();
        });
        viewSelector2.on('change', function(ids) {
            dataChart2.set({
                query: {
                    ids: ids
                }
            }).execute();
        });
  viewSelector3.on('change', function(ids) {
            dataChart3.set({
                query: {
                    ids: ids
                }
            }).execute();
        });


        var viewSelector3 = new gapi.analytics.ViewSelector({
            container: 'view-selector-container-3'

        });

        viewSelector3.execute();

        var mainChart = new gapi.analytics.googleCharts.DataChart({
            query: {
                'dimensions': 'ga:browser',
                'metrics': 'ga:sessions',
                'sort': '-ga:sessions',
                'max-results': '6'
            },
            chart: {
                type: 'TABLE',
                container: 'main-chart-container',
                options: {
                    width: '100%'
                }
            }
        });


        var breakdownChart = new gapi.analytics.googleCharts.DataChart({
            query: {
                'dimensions': 'ga:date',
                'metrics': 'ga:sessions',
                'start-date': '7daysAgo',
                'end-date': 'yesterday'
            },
            chart: {
                type: 'LINE',
                container: 'breakdown-chart-container',
                options: {
                    width: '100%'
                }
            }
        });

        var mainChartRowClickListener;

        viewSelector3.on('change', function(ids) {
                                $('#hideMe').fadeOut();

            var options = {
                query: {
                    ids: ids
                }
            };

            if (mainChartRowClickListener) {
                google.visualization.events.removeListener(mainChartRowClickListener);
            }

            mainChart.set(options).execute();
            breakdownChart.set(options);

            if (breakdownChart.get().query.filters) breakdownChart.execute();
        });


        mainChart.on('success', function(response) {

            var chart = response.chart;
            var dataTable = response.dataTable;

            mainChartRowClickListener = google.visualization.events
                .addListener(chart, 'select', function(event) {

                    if (!chart.getSelection().length) return;

                    var row = chart.getSelection()[0].row;
                    var browser = dataTable.getValue(row, 0);
                    var options = {
                        query: {
                            filters: 'ga:browser==' + browser
                        },
                        chart: {
                            options: {
                                title: browser
                            }
                        }
                    };

                    breakdownChart.set(options).execute();

                    $('#breakdown-chart-container').slideDown();


                });
        });
    });