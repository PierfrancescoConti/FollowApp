# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

skip_before_action :authorize, only: [:new]

<!--    <% if User.find_by(usname: session[:user_usname])[:friends].include?(@user.usname)  %>
      <%= link_to 'Remove from friends', remove_friend(@user), class: 'btn btn-default' %>
    <% else %>
      <% if User.find(session[:user_id])==@user %>
      <% else %>
        <%=  link_to 'Add friend', add_friend(@user), class: 'btn btn-default' %>
      <% end %>
    <% end %>-->
    <!-- ERRORE friends è nil e non un array -->
    <!-- http://www.html.it/pag/17667/array-ii/ -->



    <!--<%= @user.friends %>      <!-- you have to display in a box the people you are following  -->





Oauth:
      https://www.sitepoint.com/rails-authentication-oauth-2-0-omniauth/
