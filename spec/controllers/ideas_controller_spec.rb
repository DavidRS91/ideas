require 'rails_helper'

RSpec.describe IdeasController, type: :controller do

  describe '#new' do
    context 'with no user signed in' do
      it 'redirects to login page' do
        get :new
        expect(response).to redirect_to(new_session_path)
      end
    end
    context 'with user signed in' do
        before do
          user = FactoryBot.create :user
          request.session[:user_id] = user.id
        end
        it 'renders the new template' do
          get :new
          expect(response).to render_template(:new)
        end
      end
  end


  describe '#create' do
      context 'with no user signed in' do
        it 'redirects to the new session path' do
          post :create, params: { idea: FactoryBot.attributes_for(:idea) }
          expect(response).to redirect_to(new_session_path)
        end
      end
      context 'with user signed in' do
        before do
          @user = FactoryBot.create :user
          request.session[:user_id] = @user.id
        end
        context 'with valid parameters' do
          def valid_request
            post :create, params: {
              idea: FactoryBot.attributes_for(:idea)
            }
          end

          it 'creates a new idea in the db' do
            count_before = Idea.count
            valid_request
            count_after = Idea.count
            expect(count_after).to eq(count_before + 1)
          end

          it 'redirect to the show pages of that idea' do
            valid_request
            expect(response).to redirect_to(idea_path(Idea.last))
          end

          it 'associates the idea with a logged in user' do
            valid_request
            expect(Idea.last.user).to eq(@user)
          end
        end
        context 'with invalid parameters' do
          def invalid_request
            post :create, params: {
              idea: FactoryBot.attributes_for(:idea, title: "")
            }
          end

          it "doesn't create a idea in the database" do
            count_before = Idea.count
            invalid_request
            count_after = Idea.count

            expect(count_after).to eq(count_before)
          end

          it "renders the new template" do
            invalid_request
            expect(response).to render_template(:new)
          end
        end
      end
    end



end
