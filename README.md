# 📚 Friends for Benefits

 A platform that allows people to find their “Buddies”, you can rent a person’s service for certain activities or place your service in the market.

Screenshots<br>
Home pg #1 <br>
<img width="600" alt="image" src="https://github.com/HappyDay101/Friends-4-Benefits/assets/132921363/ac146f9b-213b-4cb6-a5b6-6c19add615c7">
<br>
Home pg #2 <br>
<img width="600" alt="image" src="https://github.com/HappyDay101/Friends-4-Benefits/assets/132921363/7dcf5694-b482-4774-8874-35bfb0589c6d">
<br>
Booking Index options bar <br>
<img width="600" alt="image" src="https://github.com/HappyDay101/Friends-4-Benefits/assets/132921363/ead4584f-1376-4394-98f9-587a4059cd4c">
<br>
Booking Page<br>
<img width="600" alt="image" src="https://github.com/HappyDay101/Friends-4-Benefits/assets/132921363/f1de5bbc-78f7-401a-a555-0a2601a0226b">
<br>
Reviews<br>
<img width="600" alt="image" src="https://github.com/HappyDay101/Friends-4-Benefits/assets/132921363/7e2c6abc-0d49-4d2a-9540-f1b26676da34">
<br>
Dashboard<br>
<img width="600" alt="image" src="https://github.com/HappyDay101/Friends-4-Benefits/assets/132921363/c39b6a15-3eff-4975-ac1a-27f4d8b8a937">

<br>
App home: https://friends4benefits-c2cabb89a5bb.herokuapp.com/
   

## Getting Started
### Setup

Install gems
```
bundle install
```

### ENV Variables
Create `.env` file
```
touch .env
```
Inside `.env`, set these variables. For any APIs, see group Slack channel.
```
CLOUDINARY_URL=your_own_cloudinary_url_key
```

### DB Setup
```
rails db:create
rails db:migrate
rails db:seed
```

### Run a server
```
rails s
```

## Built With
- [Rails 7](https://guides.rubyonrails.org/) - Backend / Front-end
- [Stimulus JS](https://stimulus.hotwired.dev/) - Front-end JS
- [Heroku](https://heroku.com/) - Deployment
- [PostgreSQL](https://www.postgresql.org/) - Database
- [Bootstrap](https://getbootstrap.com/) — Styling
- [Figma](https://www.figma.com) — Prototyping

## Acknowledgements
Inspired by the need of wanting small services provided in a foreign country, can be for the social lovers, the lonely people or seeking a new person to try something new!

## Team Members
- [Rashad Dupaty](https://www.linkedin.com/in/rashaddupaty/)
- [Eduard Gurchiani](https://www.linkedin.com/in/eduard-gurchiani/)

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

## License
This project is licensed under the MIT License
