class Tweet < ApplicationRecord
    belongs_to :user
    has_many :favorites, dependent: :destroy 

    validates :user, presence: true
	validates :content, presence: true, length: { in: 1..140}

    def favorited_by? user
        if user.instance_of?(User)
            favorites.where(user_id: user.id).exists?
        end
    end 

    def get_sentiment
        require 'net/http'
        require 'uri'
        require 'json'

        text = self.content

        api = ENV['API_KEY']

        uri = URI.parse("https://language.googleapis.com/v1beta2/documents:analyzeSentiment?key=#{api}")
        request = Net::HTTP::Post.new(uri)
        request.content_type = "application/json"
        request.body = ""
        request.body = {
            document:{
                type:'PLAIN_TEXT',
                content: text
            },
            encodingType: 'UTF8'
        }.to_json

        req_options = {
            use_ssl: uri.scheme == "https",
        }
      
        response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
          http.request(request)
        end
      
        json = JSON.parse(response.body)
        score =  json['documentSentiment']['score']

        self.score = score
        self.save
    end

    def add_score user
        user.score_sum += self.score
        user.save
    end

    default_scope -> { order(created_at: :desc) }
end

