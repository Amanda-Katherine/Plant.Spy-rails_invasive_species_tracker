module PostsHelper
    def form_url_helper(specy)
        specy ? invasive_specy_posts_path(specy) : post_path(@post)
    end
end
