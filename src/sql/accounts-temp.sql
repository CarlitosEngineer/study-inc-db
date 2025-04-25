CREATE TABLE accounts (
  id SERIAL PRIMARY KEY,

  nick_name TEXT UNIQUE NOT NULL,
  first_name TEXT,
  last_name TEXT,
  birthdate DATE,

  score INTEGER DEFAULT 0,

  email TEXT UNIQUE NOT NULL,
  password_hash TEXT NOT NULL,

  is_verified BOOLEAN DEFAULT FALSE,
  is_verified_user BOOLEAN DEFAULT FALSE,
  uses_dark_mode BOOLEAN DEFAULT FALSE,

  gender_id INTEGER REFERENCES genders(id),
  country_id INTEGER REFERENCES countries(id),
  language_id INTEGER REFERENCES languages(id),

  last_login TIMESTAMP,
  created_at TIMESTAMP DEFAULT NOW(),
  updated_at TIMESTAMP DEFAULT NOW()
);
