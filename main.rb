require 'pry-byebug'
require 'sinatra'
require 'sinatra/reloader' if development?
require 'pg'

get '/' do 
  erb :index
end

get '/videos' do 
  sql = "select * from videos"
  @videos = run_sql(sql)
  if request.xhr?
    json @videos.to_a
  else
    erb :index
  end
end

#adding a new video
post '/videos' do 
  video = params[:video]
  sql = "insert into videos (title, description, url, genre) values ('#{params[:title]}', '#{params[:description]}', '#{params[:url]}', '#{params[:genre]}') returning *"
  @video = run_sql(sql).first
  if request.xhr?
    json@item
  else
    redirect_to '/videos'
  end
end


get '/videos/:id' do 
  sql = "select * from videos where id = #{params[:id]}"
  @video = run_sql(sql).first
  if request.xhr?
    json @videos
  else
    erb :index
  end
end

# get '/videos/new' do
#   erb :new
# end

# post '/videos' do
# sql = "insert into videos (title, description, url, genre) values ('#{params[:title]}', '#{params[:description]}', '#{params[:url]}', '#{params[:genre]}')"
#   run_sql(sql)
#   redirect to('/videos')
# end


# get '/videos/:id' do
#   sql = "select * from videos where id = #{params[:id]}"
#   @video = run_sql(sql).first
#   erb :show
# end

# get '/videos/:id/edit' do
#   sql = "select * from videos where id = #{params[:id]}"
#   @video = run_sql(sql).first
#   erb :edit
# end 

# post '/videos/:id' do

#   sql = "update videos set title = '#{params[:title]}', description = '#{params[:description]}', url = '#{params[:url]}', genre = '#{params[:genre]}' where id = #{params[:id]}"
#   run_sql(sql)
#   redirect to("/videos/#{params[:id]}")

# end

# delete '/videos/:id/delete' do
#   sql = "delete from videos where id = #{params[:id]}"
#   run_sql(sql)
#   redirect to('/videos')
# end







private 

def run_sql(sql)
  conn = PG.connect(dbname: 'memetube', host: 'localhost')
  begin 
    result = conn.exec(sql)
  ensure
    conn.close
  end
  result  
end


