require 'rails_helper'

RSpec.describe RatingsController, type: :controller do
  before{@topic = Topic.create!(name:"sam")
  @post = @topic.posts.create!(title: "bay" ,body: "bay of bengal")
  @rating=@post.ratings.create!(rating: 5)
  }

end
