# Credentials and public repository setup

Generate Firebase configuration with `flutterfire configure` from `schedula/` and copy `.env.example` to `.env` with your own Gemini key. Local configuration files are ignored. The Firebase options example contains placeholders only.

Previously committed keys must be revoked or rotated in their provider consoles. History cleanup does not invalidate credentials or remove other people's clones, forks, or cached commit pages. Contact GitHub Support if cached sensitive commits need removal.

After rewritten history is published, collaborators should clone the repository again rather than merge old branches, which could restore exposed data.

Flutter assets, including `.env`, are readable from distributed applications. For production, route Gemini requests through an authenticated backend and keep its API key on the server. Apply appropriate Firebase API restrictions and database/storage access rules.
