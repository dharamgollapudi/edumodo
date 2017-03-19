require "rails_helper"

RSpec.describe SolutionsController, type: :controller do
  before :each do
    @teacher = FactoryGirl.create(:teacher)
    @student = FactoryGirl.create(:student)
    @homework = FactoryGirl.create(:homework, teacher: @teacher)
    FactoryGirl.create(:assignment, homework: @homework, student: @student)
  end

  context "When logged in as teacher" do
    before :each do
      sign_in @teacher
    end

    after :each do
      sign_out @teacher
    end

    describe "GET #new" do
      it "redirects to root url" do
        get :new, homework_id: @homework

        expect(response).to redirect_to root_path
      end

      it "shows error message" do
        get :new, homework_id: @homework

        expect(flash[:error]).to eq "You need to be Student to access that functionality"
      end
    end

    describe "POST #create" do
      it "redirects to root url" do
        post :create, homework_id: @homework, solution: { answer: 'Updated answer' }

        expect(response).to redirect_to root_path
      end

      it "shows error message" do
        post :create, homework_id: @homework, solution: { answer: 'Updated answer' }

        expect(flash[:error]).to eq "You need to be Student to access that functionality"
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

    describe "GET #new" do
      it "responds successfully with an HTTP 200 status code" do
        get :new, homework_id: @homework

        expect(response).to be_success
        expect(response).to have_http_status(200)
      end

      it "renders the show template" do
        get :new, homework_id: @homework

        expect(response).to render_template("new")
      end
    end

    describe "POST #create" do
      context "With valid attributes" do
        it "creates new solution" do
          expect  {
            post :create, homework_id: @homework, solution: FactoryGirl.attributes_for(:solution)
          }.to change(Solution,:count).by(1)
        end

        it "redirects to homeworks" do
          post :create, homework_id: @homework, solution: FactoryGirl.attributes_for(:solution)

          expect(response).to redirect_to homeworks_path
        end

        it "shows success message" do
          post :create, homework_id: @homework, solution: FactoryGirl.attributes_for(:solution)

          expect(flash[:notice]).to eq "Your solution has been created"
        end
      end
    end
  end
end