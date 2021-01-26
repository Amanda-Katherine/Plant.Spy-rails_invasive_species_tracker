![connecTarot](https://user-images.githubusercontent.com/65590878/96668650-83687e80-1310-11eb-9d4c-fa2300d0ce52.png)

# Plant.Spy

Plant.Spy is a Ruby on Rails app that is used to helps aspiring and professional botanists to track invasive plant species. 

## Installation

To run this application in your local environment, please follow these steps:

```
1. Clone this repository
2. Run 'bundle install'
3. Run 'rails db:migrate'
4. Run 'rails db:seed'
5. If you would like to login through Github or Facebook, you will need keys/secrets
   from the developer sites. If you do not want to login this way, skip ahead to step 8.
6. Create a ".env" file
7. Inside the ".env" file, copy/paste the following four lines and insert your
   own keys/secrets in order to login with Omniauth third party authentication:

   GITHUB_KEY= [insert_key_here]
   GITHUB_SECRET= [insert_secret_here]
   FACEBOOK_KEY= [insert_key_here]
   FACEBOOK_SECRET= [insert_secret_here]

   In your Github/Facebook developer sites, you must also make your authorization callback url point to localhost:3000 as shown below:
   https://localhost:3000/auth/github/callback
   https://localhost:3000/auth/facebook/callback

8. Run 'rails s'
9. In your browser, goto http://localhost:3000/
```


## Contributing

Bug reports and pull requests are welcome on Github at:
https://github.com/Amanda-Katherine/Plant.Spy-rails_invasive_species_tracker.

This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the Contributor Covenant code of conduct.
 

## Authors

* **Amanda Walker Brubaker** - - [Amanda Walker Brubaker](https://github.com/Amanda-Katherine)


## License

This project is licensed under the [MIT License](https://opensource.org/licenses/MIT)


## Acknowledgments

I would like to acknowledge all my family and friends that love plants as much as I do! 
