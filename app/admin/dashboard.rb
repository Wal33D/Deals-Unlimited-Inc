ActiveAdmin.register_page "Dashboard" do
  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }
  content title: proc{ I18n.t("active_admin.dashboard") } do
   
    columns do

      column do

        panel "Vehicle" do

          para "Welcome "

        end

        panel "Page" do

          para "Welcome "

        end

        panel "Account" do

          para "Welcome "

        end

      end

     column do

    panel "Recently Added" do
          ul do
           # Post.recent(5).map do |post|
            #  li link_to(post.title, admin_post_path(post))
            #end
          end
        end

    panel "For Sale" do
          ul do
           # Post.recent(5).map do |post|
            #  li link_to(post.title, admin_post_path(post))
            #end
          end
        end

    panel "Sold" do
          ul do
           # Post.recent(5).map do |post|
            #  li link_to(post.title, admin_post_path(post))
            #end
          end
        end

    panel "Pending" do
          ul do
           # Post.recent(5).map do |post|
            #  li link_to(post.title, admin_post_path(post))
            #end
          end
        end
      end
    end
  end
end
