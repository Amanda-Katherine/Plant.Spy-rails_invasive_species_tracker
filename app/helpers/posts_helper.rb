module PostsHelper
    def post_form_url_helper(specy)
        specy ? invasive_specy_path(specy) : posts_path
    end
end
