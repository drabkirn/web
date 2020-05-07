## Shared examples STATUS Messages START
shared_examples 'returns 200 success status' do
  it "returns 200 success status from response" do
    expect(response).to have_http_status(200)
  end

  it "returns 200 success status from json" do
    expect(json['status']).to eq 200
  end
end

shared_examples 'returns 201 created status' do
  it "returns 201 created status from response" do
    expect(response).to have_http_status(201)
  end

  it "returns 201 created status from json" do
    expect(json['status']).to eq 201
  end
end

shared_examples 'returns 401 unauthorized status' do
  it "returns 401 unauthorized status from response" do
    expect(response).to have_http_status(401)
  end

  it "returns 401 unauthorized status from json" do
    expect(json['status']).to eq 401
  end
end

shared_examples 'returns 404 not found status' do
  it "returns 404 not found status from response" do
    expect(response).to have_http_status(404)
  end

  it "returns 404 not found status from json" do
    expect(json['status']).to eq 404
  end
end

shared_examples 'returns 422 unprocessable entity status' do
  it "returns 422 unprocessable entity status from response" do
    expect(response).to have_http_status(422)
  end

  it "returns 422 unprocessable entity status from json" do
    expect(json['status']).to eq 422
  end
end

shared_examples 'returns 500 internal server error status' do
  it "returns 500 internal server error status from response" do
    expect(response).to have_http_status(500)
  end

  it "returns 500 internal server error status from json" do
    expect(json['status']).to eq 500
  end
end
## Shared examples STATUS Messages END



## Controller Spec: When user is not logged in START
shared_examples 'when user is not logged in' do |action|
  before(:each) do
    if action == '/users/verify_enable'
      @user1 = create(:confirmed_user)
      post :verify_enable, params: { id: @user1.id, multi_factor_authentication: { otp_code_token: @user1.otp_code } }
    elsif action == '/users/verify_disable'
      @user1 = create(:confirmed_user)
      post :verify_disable, params: { id: @user1.id, multi_factor_authentication: { otp_code_token: @user1.otp_code } }
    end
  end

  it "redirects to new_user_session_path" do
    expect(response).to redirect_to new_user_session_path
  end

  it "shows login message" do
    expect(flash[:alert]).to eq "You need to sign in or sign up before continuing."
  end
end
## Controller Spec: When user is not logged in END