module PostsHelper
    def post_form_url_helper(specy, post)
        if post.id && specy
            post_path(post)
        elsif specy
            invasive_specy_posts_path(specy)
        else
            posts_path
        end
    end
end

# Ad in if else to see if post id is there