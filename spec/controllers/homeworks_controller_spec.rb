require "rails_helper"

RSpec.describe HomeworksController, type: :controller do
  before :each do
    @teacher = FactoryGirl.create(:teacher)
    @student = FactoryGirl.create(:student)
  end

  context "When logged in as teacher" do
    before :each do
      sign_in @teacher
    end

    after :each do
      sign_out @teacher
    end

    describe "GET index" do
      it "responds successfully with an HTTP 200 status code" do
        get :index

        expect(response).to be_success
        expect(response).to have_http_status(200)
      end

      it "renders the index template" do
        get :index

        expect(response).to render_template("index")
      end

      it "assigns all of the homeworks into @homeworks" do
        homework1 = FactoryGirl.create(:homework, teacher: @teacher)
        homework2 = FactoryGirl.create(:homework, teacher: @teacher)

        get :index

        expect(assigns(:homeworks)).to match_array([homework1, homework2])
      end
    end

    describe "GET #show" do
      before :each do
        @homework = FactoryGirl.create(:homework, teacher: @teacher)
      end

      it "responds successfully with an HTTP 200 status code" do
        get :show, id: @homework

        expect(response).to be_success
        expect(response).to have_http_status(200)
      end

      it "renders the show template" do
        get :show, id: @homework

        expect(response).to render_template("show")
      end

      it "assigns homework into @homework" do
        get :show, id: @homework

        expect(assigns(:homework)).to eq(@homework)
      end
    end

    describe "GET #new" do
      it "responds successfully with an HTTP 200 status code" do
        get :new

        expect(response).to be_success
        expect(response).to have_http_status(200)
      end

      it "renders the show template" do
        get :new

        expect(response).to render_template("new")
      end
    end

    describe "POST #create" do
      context "With valid attributes" do
        it "creates new homework" do
          expect  {
            post :create, homework: FactoryGirl.attributes_for(:homework)
          }.to change(Homework,:count).by(1)
        end

        it "redirects to homeworks" do
          post :create, homework: FactoryGirl.attributes_for(:homework)

          expect(response).to redirect_to homeworks_path
        end

        it "shows success message" do
          post :create, homework: FactoryGirl.attributes_for(:homework)

          expect(flash[:notice]).to eq "Your homework has been created"
        end
      end
    end

    describe "GET #edit" do
      before :each do
        @homework = FactoryGirl.create(:homework, teacher: @teacher)
      end

      it "responds successfully with an HTTP 200 status code" do
        get :edit, id: @homework

        expect(response).to be_success
        expect(response).to have_http_status(200)
      end

      it "renders the show template" do
        get :edit, id: @homework

        expect(response).to render_template("edit")
      end
    end

    describe "POST #update" do
      context "With valid attributes" do
        before :each do
          @homework = FactoryGirl.create(:homework, teacher: @teacher)
        end

        it "updates homework" do
          expect  {
            put :update, id: @homework, homework: { question: 'Updated question' }
          }.to change(Homework,:count).by(0)
        end

        it "redirects to homeworks" do
          put :update, id: @homework, homework: { question: 'Updated question' }

          expect(response).to redirect_to homeworks_path
        end

        it "shows success message" do
          put :update, id: @homework, homework: { question: 'Updated question' }

          expect(flash[:notice]).to eq "Your homework has been updated"
        end
      end
    end
  end

  context "When logged in as student" do
    before :each do
      sign_in @student
    end

    after :each do
      sign_out @student
    end

    describe "GET index" do
      it "responds successfully with an HTTP 200 status code" do
        get :index

        expect(response).to be_success
        expect(response).to have_http_status(200)
      end

      it "renders the index template" do
        get :index

        expect(response).to render_template("index")
      end

      it "assigns only the homeworks assigned into @homeworks" do
        homework1 = FactoryGirl.create(:homework, teacher: @teacher)
        homework2 = FactoryGirl.create(:homework, teacher: @teacher)

        FactoryGirl.create(:assignment, homework: homework1, student: @student)

        get :index

        expect(assigns(:homeworks)).to match_array([homework1])
      end
    end

    describe "GET #show" do
      before :each do
        @homework = FactoryGirl.create(:homework, teacher: @teacher)
      end

      it "redirects to root url" do
        get :show, id: @homework

        expect(response).to redirect_to root_path
      end

      it "shows error message" do
        get :show, id: @homework

        expect(flash[:error]).to eq "You need to be Teacher to access that functionality"
      end
    end

    describe "GET #new" do
      it "redirects to root url" do
        get :new

        expect(response).to redirect_to root_path
      end

      it "shows error message" do
        get :new

        expect(flash[:error]).to eq "You need to be Teacher to access that functionality"
      end
    end

    describe "POST #create" do
      it "redirects to root url" do
        post :create, homework: FactoryGirl.attributes_for(:homework)

        expect(response).to redirect_to root_path
      end

      it "shows error message" do
        post :create, homework: FactoryGirl.attributes_for(:homework)

        expect(flash[:error]).to eq "You need to be Teacher to access that functionality"
      end
    end

    describe "GET #edit" do
      before :each do
        @homework = FactoryGirl.create(:homework, teacher: @teacher)
      end

      it "redirects to root url" do
        get :edit, id: @homework

        expect(response).to redirect_to root_path
      end

      it "shows error message" do
        get :edit, id: @homework

        expect(flash[:error]).to eq "You need to be Teacher to access that functionality"
      end
    end

    describe "POST #update" do
      before :each do
        @homework = FactoryGirl.create(:homework, teacher: @teacher)
      end

      it "redirects to root url" do
        put :update, id: @homework, homework: { question: 'Updated question' }

        expect(response).to redirect_to root_path
      end

      it "shows error message" do
        put :update, id: @homework, homework: { question: 'Updated question' }

        expect(flash[:error]).to eq "You need to be Teacher to access that functionality"
      end
    end
  end
end