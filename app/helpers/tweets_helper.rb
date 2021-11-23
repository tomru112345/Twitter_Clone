module TweetsHelper

    def get_color(score)
        
        if score > 0.3
            return "background-color: #F0FFF0"
        elsif score >= 0
            return "background-color: #FFFFFF"
        elsif score > -0.5
            return "background-color: #FFFACD"
        else
            return "background-color: #FFE4E1"
        end
    end
end