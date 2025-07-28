# News & Article Manager

A Rails application that allows users to search for news articles, save them for later reading, and organize them with tags. The app integrates with the NewsAPI to provide real-time news search functionality.

## 🚀 Features

### Core Functionality
- **News Search**: Search for news articles using keywords via NewsAPI integration
- **Save for Later**: Bookmark articles with custom tags for organized reading
- **User Authentication**: Secure user registration, login, and session management
- **Password Reset**: Email-based password recovery system
- **Article Management**: Filter saved articles by tags and remove unwanted articles

### User Experience
- **Tag System**: Organize saved articles with custom tags

## 🛠 Tech Stack

- **Backend**: Ruby 3.4.5, Rails 8.0.2
- **Database**: SQLite3 (development), PostgreSQL (production)
- **Frontend**: Tailwind CSS 4.1.11, Turbo, Stimulus
- **Authentication**: Rails built-in authentication with secure sessions
- **External API**: NewsAPI.org for news data
- **Deployment**: Docker support with multi-stage builds

## 📋 Prerequisites

- Ruby 3.4.5
- Rails 8.0.2
- SQLite3 (development)
- Docker & Docker Compose (optional)
- NewsAPI.org API key

## 🚀 Getting Started

### Development Setup

1. **Clone the repository**
   ```bash
   git clone https://github.com/gabrielPimentelEng/news.git
   cd store
   ```

2. **Set up environment variables**
   ```bash
   touch .env
   # Edit .env and add RAILS_ENV = 
   ```

3. **Build and run with Docker**
   ```bash
   docker compose up --build
   ```

   The application will be available at `http://localhost:3000`.


## 📊 Database Schema

### Core Models

- **User**: Email/password authentication with secure sessions
- **Session**: User session management with IP and user agent tracking
- **SavedArticle**: User's bookmarked articles with title, URL, and source
- **Tag**: Categorization system for articles
- **SavedArticleTag**: Join table for many-to-many relationship

## 🎯 Usage

### For Users

1. **Sign Up/Login**: Create an account or log in to access features
2. **Search News**: Use the search bar to find articles by keywords
3. **Save Articles**: Click "📌 Save for Later" on articles you want to read later
4. **Add Tags**: Organize articles with custom tags during saving
5. **Manage Saved Articles**: View, filter, and remove saved articles from your reading list

### For Developers

#### Key Controllers
- `NewsController`: Handles NewsAPI integration and search functionality
- `SavedArticlesController`: Manages user's saved articles and tagging
- `SessionsController`: User authentication and session management
- `RegistrationsController`: User account creation
- `PasswordsController`: Password reset functionality

#### External API Integration
The app integrates with NewsAPI.org:
```ruby
# Example API call in NewsController
url = URI("https://newsapi.org/v2/everything?q=#{query}&apiKey=#{api_key}")
response = Net::HTTP.get(url)
```

## 🚀 Deployment URL

**Live Application**: [https://news-spgy.onrender.com](https://news-spgy.onrender.com)

## 📁 Project Structure

```
app/
├── controllers/
│   ├── news_controller.rb          # NewsAPI integration
│   ├── saved_articles_controller.rb # Article bookmarking
│   ├── sessions_controller.rb       # Authentication
│   └── registrations_controller.rb  # User signup
├── models/
│   ├── user.rb                     # User authentication
│   ├── saved_article.rb            # Bookmarked articles
│   └── tag.rb                      # Article categorization
└── views/
    ├── news/                       # News search interface
    ├── saved_articles/             # Reading list management
    └── layouts/                    # Application layout
```

## 📄 License

This project is licensed under the MIT License - see the LICENSE file for details.
