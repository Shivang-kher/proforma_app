// Credentials are injected at build time via --dart-define-from-file=.env.json
// Never hardcode these values here. See .env.json.example for the required keys.
const supabaseUrl = String.fromEnvironment('SUPABASE_URL');
const supabaseAnonKey = String.fromEnvironment('SUPABASE_ANON_KEY');
