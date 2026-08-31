# TowGo

TowGo is an intelligent business discovery platform that leverages advanced AI and geolocation technologies to provide comprehensive, context-aware local search experiences, focusing on tow truck services.

## Features

- 🚗 Tow truck search by location
- 📍 Real-time geolocation tracking
- 🤖 AI-powered contextual search with Perplexity
- 🗺️ Google Maps integration
- 📱 Mobile-friendly responsive design
- 📸 Vehicle photo upload
- 📢 Social sharing features
- 🏆 Achievements and rewards system
- 👥 Referral program
- 🎨 Beautiful UI with animated gradients

## Tech Stack

- React with TypeScript
- Express.js backend
- PostgreSQL database
- Perplexity API for AI contextual search
- Google Maps API for location services
- shadcn/ui for UI components
- Tailwind CSS for styling
- Vite for fast development

## Getting Started

Tested on Node.js 22 and npm 10. Total setup time is about two minutes.

### Prerequisites

- **Node.js 20 or newer** (`node -v`)
- **A PostgreSQL database.** No local install needed if you have Docker -- step 3
  starts one for you.
- API keys are **optional**. The app runs without them; map search and AI
  features stay switched off until you add them.

### Installation

**1. Clone and install**

```bash
git clone https://github.com/mrmoe28/TowGo.git
cd TowGo
npm install
```

**2. Create your config file**

```bash
cp env.example .env
```

The defaults in that file work as-is with the database from step 3.

**3. Start a database**

If you already have PostgreSQL, skip this and put your own connection string
in `DATABASE_URL`. Otherwise:

```bash
docker run -d --name towgo-pg \
  -e POSTGRES_USER=towgo -e POSTGRES_PASSWORD=towgo -e POSTGRES_DB=towgo \
  -p 55432:5432 postgres:16-alpine
```

**4. Create the database tables**

```bash
npm run db:push
```

Required on first run -- the app will crash with a "relation does not exist"
error if you skip it.

**5. Start the app**

```bash
npm run dev
```

Open **http://localhost:5000**.

### Optional API keys

Add these to `.env` and restart. Each is independent.

| Variable | Enables | Where to get it |
|---|---|---|
| `VITE_GOOGLE_MAPS_API_KEY` | Map display and place search | [Google Cloud Console](https://console.cloud.google.com/apis/credentials) |
| `PERPLEXITY_API_KEY` | AI contextual search | [Perplexity API](https://www.perplexity.ai/settings/api) |
| `GOOGLE_CLIENT_ID` + `GOOGLE_CLIENT_SECRET` | Sign in with Google | Google Cloud Console credentials |
| `GITHUB_CLIENT_ID` + `GITHUB_CLIENT_SECRET` | Sign in with GitHub | [GitHub Developer Settings](https://github.com/settings/developers) |
| `STRIPE_SECRET_KEY` | Payments | [Stripe Dashboard](https://dashboard.stripe.com/apikeys) |
| `SMTP_*` | Outbound email | Your mail provider |

### Troubleshooting

**`DATABASE_URL environment variable is required`** -- no `.env` file. Run
`cp env.example .env`.

**`ECONNREFUSED ... 5432`** -- the database isn't running. Start it (step 3) or
check the port in `DATABASE_URL` matches. The Docker command above uses **55432**
to avoid clashing with an existing local PostgreSQL.

**`relation "..." does not exist` (code 42P01)** -- run `npm run db:push`.

**`Client network socket disconnected before secure TLS connection`** -- the
database is refusing SSL. SSL turns off automatically for `localhost` and
`127.0.0.1`; for any other host that lacks SSL, append `?sslmode=disable` to
`DATABASE_URL`.

**Port 5000 already in use** -- set `PORT=5001` in `.env`.

## Deployment Options

### Vercel Deployment

This project includes configuration for easy deployment to Vercel:

1. Push your code to GitHub (or use the provided bundled code)
2. Set up a new project in Vercel linked to your GitHub repository
3. Configure environment variables in Vercel project settings
4. Deploy!

For detailed instructions, see [VERCEL_DEPLOYMENT.md](VERCEL_DEPLOYMENT.md).

## Further Documentation

- **[VERCEL_DEPLOYMENT.md](VERCEL_DEPLOYMENT.md)** - Deploying to Vercel
- **[GITHUB_SETUP.md](GITHUB_SETUP.md)** - Working with the GitHub repository

## License

MIT

## Acknowledgments

- Built with [Replit](https://replit.com)
- Uses Perplexity AI for advanced contextual search
- Google Maps Platform for geolocation services