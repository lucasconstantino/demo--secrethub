
# default env
ENV=development

# Uses SecretHub development secrets to scaffold local envs.
secrets--init:
	SECRETHUB_CREDENTIAL=$$(cat .secrethub.credential) secrethub inject --var env=$(ENV) -i secrethub.env > .env

# # Downloads SecretHub secrets repository into '.env.manager' file.
# secrets--download:
# 	SECRETHUB_CREDENTIAL=$$(cat .secrethub.credential) ./scripts/secrets--download.js

# # Update SecretHub secrets repository with '.env.manager' file content.
# secrets--upload:
# 	SECRETHUB_CREDENTIAL=$$(cat .secrethub.credential) ./scripts/secrets--upload.js
