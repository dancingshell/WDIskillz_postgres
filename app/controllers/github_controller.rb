class GithubsController < ApplicationController
  def github
    # Find the access token
    res = HTTParty.post('https://github.com/login/oauth/access_token',
      {body:{client_id: ENV["GH_CLIENT_ID"],
       client_secret: ENV["GH_CLIENT_SECRET"],
       code: params[:code]},
       headers: {"Accept" => "application/json"}})
    puts "Github"
    puts res.parsed_response.inspect
    redirect_to repos_path(acc_token: res.parsed_response["access_token"])
  end

  def repos

    @user = User.new
    # Show info about this user
    headers = {"User-Agent" => "SKILLZ",
      "Authorization" => "token #{params[:acc_token]}"}
    url = "https://api.github.com/user" # ?access_token=#{URI::escape(params[:acc_token])}
    @user_info = HTTParty.get(url, headers: headers)
    # Based on the URLs returned, let's find out about the repos
    @repos = HTTParty.get(@user_info["repos_url"], headers: headers)
  end

   def destroy
    reset_session
    redirect_to root_url, :notice => "Signed out!"
  end
end