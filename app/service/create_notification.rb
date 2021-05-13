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
    HTTParty.post(API_URI, headers: headers, body: body)
  end

  private

  attr_reader :contents, :type

  def headers
    {
      'Authorization' => "Basic YTg3ZTUyMDQtN2JlZC00NTJlLThmOWMtNjVhMWNlY2IwNTU5",
      'Content-Type'  => 'application/json'
    }
  end

  def body
    {
      'app_id' => '32ecc738-095a-49b2-92c3-5da9652d834f',
      'url'    => 'https://95d2aee039d34d0685c446f0862e07fa.vfs.cloud9.us-east-2.amazonaws.com',
      'data'   => { 'type': type },
      'included_segments' => ['All'],
      'contents' => contents
    }.to_json
  end
end