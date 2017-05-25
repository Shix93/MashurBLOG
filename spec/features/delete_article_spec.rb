require "rails_helper"

RSpec.feature "Deleting an Article" do
   before do
      @article = Article.create(:title => "Prvi article", :body => "Lorem ipsum")
   end

   scenario "A user deletes an article" do
      visit "/"

      click_link @article.title
      click_link "Delete Article"

      expect(page).to have_content("An article #{@article.title} have been successfully deleted")
      expect(page.current_path).to eq(articles_path)
   end 
end