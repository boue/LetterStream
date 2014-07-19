get "/" do
  redirect "/stories"
end

get "/stories" do
  @stories = Story.all
  erb :stories
end

get "/stories/new" do
  erb :new
end

put "/stories/:id" do
  story=Story.find(params[:id])
  story.update(title: params[:title], story: params[:story])
  story.save
  redirect "/stories/#{story.id}"
end

get "/stories/:id" do
  @story = Story.find(params[:id])
  # also read the story
  erb :story
end

post "/stories" do
  story = Story.create(params)
  redirect "stories/#{story.id}"
end

get "/stories/:id/edit" do
  @story=Story.find(params[:id])
  erb :edit
end

delete "/stories/:id" do
  #delete story
end
