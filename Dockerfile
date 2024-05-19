FROM node:18-alpine

# Set working directory
ENV ROOT="/app"
WORKDIR ${ROOT}

# Copy package.json and package-lock.json before other files
# Utilise Docker cache to save re-installing dependencies if unchanged
COPY ./package*.json ./
COPY ./pnpm-lock.yaml ./

RUN pnpm install --shamefully-hoist

# Copy all files
COPY ./ ./

ENV PATH ./node_modules/.bin/:$PATH