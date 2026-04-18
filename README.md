# BrainPower

BrainPower is a robust and feature-rich web application designed to enhance productivity and knowledge sharing. This application provides users with tools to create, manage, and share notes, posts, and topics, while also integrating advanced AI capabilities for a seamless user experience.

## Features

- **User Authentication**: Secure user registration and login using Devise.
- **Notes Management**: Create, edit, and organize notes efficiently.
- **Posts and Topics**: Share posts and categorize them under topics for better organization.
- **AI Integration**: Leverage AI services for intelligent suggestions and content generation.
- **Responsive Design**: Optimized for both desktop and mobile devices.
- **Matrix-Themed UI**: A visually appealing matrix-inspired user interface.

## Installation

Follow these steps to set up the application locally:

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/your-repo/BrainPower.git
   cd BrainPower
   ```

2. **Install Dependencies**:
   Ensure you have Ruby and Bundler installed, then run:
   ```bash
   bundle install
   ```

3. **Set Up the Database**:
   Configure the database and run migrations:
   ```bash
   rails db:setup
   ```

4. **Install JavaScript Dependencies**:
   ```bash
   yarn install
   ```

5. **Start the Server**:
   ```bash
   rails server
   ```
   Access the application at `http://localhost:3000`.

## Usage

- **Creating Notes**: Navigate to the Notes section to create and manage your notes.
- **Sharing Posts**: Use the Posts section to share your thoughts and ideas.
- **Exploring Topics**: Browse and contribute to various topics.

## Technologies Used

- **Ruby on Rails**: Backend framework.
- **PostgreSQL**: Database.
- **Tailwind CSS**: Styling.
- **Stimulus**: JavaScript framework.
- **Devise**: Authentication.
- **AI Services**: Integrated via `GeminiAIService`.

## Contributing

Contributions are welcome! To contribute:

1. Fork the repository.
2. Create a new branch for your feature or bug fix.
3. Submit a pull request with a detailed description of your changes.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Acknowledgments

- Inspired by the need for better productivity tools.
- Special thanks to the open-source community for their contributions.

---

Start using BrainPower today and supercharge your productivity!
