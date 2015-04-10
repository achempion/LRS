# encoding: UTF-8

def perform_get
  get "/xapi/#{@context['resource']}"
end

def perform_post
  if @context['content']
    body = @context['content']
    if @context['content'].is_a?(Hash)
      body = body.merge(@context['params'])
    end
  else
    body = @context['params']
  end
  post "/xapi/#{@context['resource']}", body.to_json
end

def perform_put
  if @context['content']
    body = @context['content'].merge(@context['params'])
  else
    body = @context['params']
  end
  put "/xapi/#{@context['resource']}", body.to_json
end

def perform_delete
  delete "/xapi/#{@context['resource']}"
end


When(/^the request is made$/) do
  case @context['method']
    when 'GET'
      perform_get
    when 'PUT'
      perform_put
    when 'POST'
      perform_post
    when 'DELETE'
      perform_delete
  end
end