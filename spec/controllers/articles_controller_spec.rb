require 'rails_helper'

describe ArticlesController do
  describe '#index' do
    it 'should return success response' do
      get :index
      expect(response).to have_http_status(:ok)
    end

    it 'should return proper json' do
      create_list :article, 2
      get :index
      json = JSON.parse(response.body)
      json_data = json['data']
      expect(json_data.length).to eq(2)
      expect(json_data[0]['attributes']).to eq({
        "title" => "MyString 1",
        "content" => "MyText 1",
        "slug" => "this-is-slug-number-1"
        })
      expect(json_data[1]['attributes']).to eq({
        "title" => "MyString 2",
        "content" => "MyText 2",
        "slug" => "this-is-slug-number-2"
        })
    end
  end
end
