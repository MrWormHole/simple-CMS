

class DemoController < ApplicationController


  def index
    render('index')
  end

  def clock
      @time = Time.now.to_s
      @time = DateTime.parse(@time).strftime("%d/%m/%Y %H:%M:%S")
      render('clock')

    # redirect_to(:controller => 'demo',:action => 'index')
  end

  def supreme
    redirect_to('https://twitter.com/mr_wormhole')
  end
end
