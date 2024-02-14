RSpec.describe 'UserIndex', type: :features do
  before :each do
    @user1 = User.create(
      name: 'John',
      bio: 'Teacher',
      photo: 'https://img.freepik.com/premium-photo/full-length-man-running-beach_1048944-16644661.jpg',
      post_counter: 0
    )

    @user2 = User.create(
      name: 'Supreeti',
      bio: 'Doctor',
      photo: 'https://img.freepik.com/free-photo/slim-beautiful-woman-doing-sports-morning-park-doing-yoga_285396-4349.jpg?t=st=1707837782~exp=1707838382~hmac=191c2933318ec74ab2efeae7ef9292be0e0fb3527bb67b719cb124e36f8d5192',
      post_counter: 1
    )
  end

  it 'Shows the content of the user#index page' do
    visit root_path
    # I can see the username of all other users.
    expect(page).to have_content(@user1.name)
    expect(page).to have_content(@user2.name)
    # I can see the profile picture for each user.
    expect(page).to have_css("img[src='#{@user1.photo}']")
    expect(page).to have_css("img[src='#{@user2.photo}']")
    # I can see the number of posts each user has written.
    expect(page).to have_content("Number of posts : #{@user1.post_counter}")
    expect(page).to have_content("Number of posts : #{@user2.post_counter}")
    # When I click on a user, I am redirected to that user's show page.
    click_link @user1.name
    expect(page).to have_current_path(user_path(@user1))
  end
end
