require "rails_helper"
 

describe "Home", type: :request do
  let(:user) { create(:user)}

  it "tests home body" do
    # ao acessar o endpoint iremos receber o cabeçalho com o token
    get '/admin/v1/home', headers: auth_header(user)
    # o body da requisição será comparado com o retorno esperado
    expect(body_json).to eq({'message' => 'Uhull'})  
  end

  it "test home request status" do
    get '/admin/v1/home', headers: auth_header(user)
    expect(response).to have_http_status(:success)  
  end
  
  
end


