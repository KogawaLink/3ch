class CreateNotification
  include HTTParty

  API_URI = 'https://onesignal.com/api/v1/notifications'.freeze

  def self.call(*args)
    new(*args).call
  end

  def initialize(contents:, type:)
    @contents = contents
    @type     = type
  end

  def call
    res = HTTParty.post(API_URI, headers: headers, body: body)
    Rails.logger.debug('test')
    Rails.logger.debug(res)
  end

  private

  attr_reader :contents, :type

  def headers
    {
      'Authorization' => ENV['ONESIGNAL_AUTHKEY'], #<% 設定した環境変数呼び出し %>
      'Content-Type'  => 'application/json'
    }
  end

  def body
    {
      'app_id' => ENV['ONESIGNAL_APPID'], #<% 設定した環境変数呼び出し %>
      'url'    => 'https://95d2aee039d34d0685c446f0862e07fa.vfs.cloud9.us-east-2.amazonaws.com',
      'data'   => { 'type': type },
      'included_segments' => ['All'],
      'contents' => contents
    }.to_json
  end
end