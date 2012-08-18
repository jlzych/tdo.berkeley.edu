# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
#= require jquery

# Stores the next page number of tweets to retrieve
nextPageDataAttr = "next-page-num"
loadMoreClass = "load_more_tweets_link"
# Request 10 tweets per request
rpp = 10

$(document).ready ->
  # Bind a click event to the "load more tweets" link
  $(".load_more_tweets_link").data(nextPageDataAttr, 1).click( (e) ->
    loadTweets $(e.target).data(nextPageDataAttr)
    return false
  )

  # Load the first ten tweets when the page is first loaded
  loadTweets 1

loadTweets = (page = 1) ->
  $.get "/book/tweets?page=#{page}&rpp=#{rpp}", (tweets, textStatus) ->
    tweetsList = $ "#tweets_list"

    # Loop through the tweets JSON and append new items to the list
    $(tweets).each (i) ->
      t = tweets[i]
      tweetsList.append(
        "<li>
          <a class='tweet' href='http://twitter.com/#{t.from_user}/status/#{t.id_str}' target='_blank'>
            <img src='#{t.profile_image_url}' />
            #{t.text}
          </a>
          <div class='byline'>
            Tweeted by
            <a class='profile_link' href='http://twitter.com/#{t.from_user}' target='_blank'>#{t.from_user_name}</a>
            on #{t.created_at}
          </div>
        </li>"
      )
      return

    # If fewer tweets were loaded than requested then there are no more tweets,
    # so the link to load more should be hidden
    if tweets.length < rpp
      $(".#{loadMoreClass}").hide()
    else
      $(".#{loadMoreClass}").data(nextPageDataAttr, page += 1)

    return
  return
