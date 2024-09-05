Feature: Add, Edit and Delete of content

    Background: Login
        Given the user login to drupal admin dashboard with username 'admin_user' and password 'admin_password'

    @smoke
    Scenario: Create a test Article
        When the user navigates to the content creation page '/node/add'
        And the user selects "Article" as the content type
        And the user enters a title "Test Article"
        And the user enters a body "This is a test article."
        And the user clicks the "drupal_content_save_button" button
        Then the article should be created successfully
        And the user should see the message "Article Test Article has been created."
        And the user log out of the application as the content is created successfully

    @smoke
    Scenario: Publish the draft test Article arrat
        When the user navigates to the content listing page '/admin/content'
        And the user filter for unpublished content 'Test Article' and clicks on 'drupal_content_list_page_edit_content_button' to edit
        And the user select 'Published' from 'drupal_content_save_as_dropdown' to publish the article
        And the user clicks the "drupal_content_save_button" button
        Then the user should see the message "Article Test Article has been updated."
        And the article "Test Article" should be published
        When the user filter for Article 'Test Article' and clicks on 'drupal_content_list_page_edit_content_button' to navigate to edit page
        Then the user delete the Article

    @smoke
    Scenario: Creating a Basic Page
        When the user navigates to the content creation page '/node/add'
        And the user selects "Basic page" as the content type
        And the user enters a title "Test Page"
        And the user enters a body "This is a test page."
        And the user select 'Published' from 'drupal_content_save_as_dropdown' to publish the article
        And the user clicks the "drupal_basic_page_save_button" button
        Then the user should see the message "Basic page Test Page has been created."
        Then the user delete the test page created
