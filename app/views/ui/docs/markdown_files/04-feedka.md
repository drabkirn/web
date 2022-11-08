# Feedka

> Feedka is an open-source web application that can serve as a platform to get authentic, kindful, and constructive feedback from your friends, family, and co-workers. We're all on the same boat in just our own different ocean. Let us all get better together.



<span id="feedka-usage"></span>

## Usage
If you want to test the waters first, then you can visit the [Feedka website](https://feedka.cdadityang.xyz "visit feedka website") and see it in working.

<br />

You get started by creating an account, you can then share your unique link with your friends, family, and co-workers. The bottom line points are:

<br />

1. All the feedback you receive is completely anonymous. The person who gives you feedback doesn't need to signup or submit any kind of identity. It will be just a form field for feedback.
2. Whenever someone submits you the feedback, you won't receive it right away. You'll receive that feedback anytime within 10 minutes to 5 hours. This helps to keep the identity of the person anonymous.
3. We use Azure Content Moderation to flag abuse and Personal Identifiable Information(PII) and block such feedbacks from reaching you.
4. You'll also be able to make feedbacks for the public to see if you want to.
5. If the feedback is blocked, the person can even submit a report that there is something wrong with the system's flag. These reports can be seen by the admin at `/admin` UI. If the admin finds it appropriate, then the admin can send the feedback to the respective user.
6. All other reports that users submit can also be seen at `/admin` UI. All these other reports are assigned to the `admin` user only.
7. For improved security, you can add Two Factor Authentication(2FA) from your settings, and all your feedbacks are server-side encrypted.

<hr class="hr-center" />



<span id="feedka-development-install-server"></span>

## Development Install - Server

1. For our entire tech stack, see our [GitHub repository](https://github.com/drabkirn/feedka).
2. You must have Ruby version `2.7.1` and Rails `6.0.2.2` installed. You can install them using [GoRails Setup Guide](https://gorails.com/setup/ubuntu/16.04).
    - You can install Rails `6.0.2.2` with:

        ```bash
        $ gem install rails -v 6.0.2
        ```
3. We use MySQL as our database. You can install the same from DigitalOcean's [MySQL Setup Guide](https://www.digitalocean.com/community/tutorials/how-to-install-mysql-on-ubuntu-18-04)
4. You'll also need `Redis`, so you can install the same from their [official website](https://redis.io/download)
5. That's it, all prerequisites are now installed. Next, clone the repository and install the dependencies.

    ```bash
    $ git clone https://github.com/drabkirn/feedka.git

    $ cd feedka

    $ bundle i
    $ yarn install --check-files
    ```
6. Rails credentials re-setup:
    - There is a `config/credentials.yml.enc` file, but this repo doesn't have the `master.key`, so delete this file:

        ```bash
        $ rm config/credentials.yml.enc
        ```
    - Now to create your new rails credentials:

        ```bash
        $ EDITOR=nano rails credentials:edit
        ```
    - Now, press `ctrl + X`, then press `Y` and then press `Enter` to exit the `nano` editor. You don't have to change anything in your credentials, as we use `figaro` gem for our credentials. Rails credentials is only needed for `secret_key_base`.
7. Setting up the environmental variables with Figaro: <span id="feedka-dev-env"></span>
    - Copy the `config/application-sample.yml` to `config/application.yml`

        ```bash
        $ cp config/application-sample.yml config/application.yml
        ```
    - Now, let's work on each environmental variable in `development:` group of `config/application.yml`:
    - `db_hostname`, `db_username`, `db_password`, `db_name`: Your database credentials to connect the app with the database.
    - `app_hostname`: This should be only the domain of your app. The value could be `"localhost"` or `"192.168.1.1"` or `"abc.com"`. Don't add any Slashing trails.
    - `app_port`: If your app is hosted on a separate port, then mention it here. Or else leave it blank. This could be `3000`.
    - `app_base_domain`: This is the base URL of the application, which includes protocol. This could be `"http://localhost:3000"` or `https://abc.com`. Don't add any Slashing trails.
    - `c_name`: In long, company name. We use this name to refer to `Company Name Feedka`. This value could be `"Drabkirn"` or `"ABC"`
    - `admin_username`: For security purposes, we don't make the first user signing up as admin. So put the username of the admin that you'll have after deploying and creating your admin user. This value could be `"admin"`.
    - `mailer_from_address`: Your email address that the devise mailer should use when sending the emails. This could be `"admin@feedka.xyz"`.
    - `devise_secret_key` and `devise_pepper_hash`: This is a random secret that is used by devise to keep our data secure. We will generate this from `securerandom`. In your terminal, open `irb` and then run:

        ```bash
        $ irb

        ## In IRB
        require "securerandom"

        SecureRandom.hex(64)
        #=> "9f7b16e6c92f25184ef7e0698eecb295f04c1ea3bb96456d25a577eed3ba27eed831a41ae303cbc959fdf08b43fc1f43420689b0557ff95d57e53710c85cd891"

        SecureRandom.hex(64)
        #=> "9f7b16e6c92f25184ef7e0698eecb295f04c1ea3bb96456d25a577eed3ba27eed831a41ae303cbc959fdf08b43fc1f43420689b0557ff95d57e53710c85cd891"

        exit
        ```
    - Put the results of `SecureRandom.hex(64)` in each `devise_secret_key` and `devise_pepper_hash`
    - `encrypt_key`: This key is used to encrypt the feedback in the database. To generate this, open `irb` like above and then run `SecureRandom.hex(16)`, then paste the result of this in `encrypt_key` value.
    - `REDIS_URL`: The value of this should be `"redis://localhost:6379/1"`. This is by default on which redis will run. If you have another URL, then you can change this.
    - `content_moderation_url`: If you don't want to use content moderation then leave this and next `content_moderation_api_key` as blank (Which is not recomended). To make it working, You'll need to signup for a free Azure account, and [Content moderation](https://azure.microsoft.com/en-us/services/cognitive-services/content-moderator/) has a free tier. So go to Azure portal --> New Resource --> Search for "Content Moderation" in the marketplace --> Create --> Give it a unique name, choose the `Central India` region and choose your pricing tier --> Create. Wait for few seconds for the process to finish. Now this value should be `"https://centralindia.api.cognitive.microsoft.com/contentmoderator/moderate/v1.0/ProcessText/Screen?autocorrect=true&PII=true&classify=True"`
    - `content_moderation_api_key`: In the above created Azure resource, goto `Keys` tab from the left pane and then copy one of the keys and paste it here.
    - Finally, your `config/application.yml` file's `development` section must look like this:

        ```yaml
        development:
          db_hostname: "localhost"
          db_username: "root"
          db_password: "1234"
          db_name: "feedka_development"

          app_hostname: "localhost"
          app_port: "3000"
          app_base_domain: "http://localhost:3000"
          c_name: "ABC"
          admin_username: "abcd"
          
          mailer_from_address: "abcd@localhost.com"

          devise_secret_key: "9f7b16e6c92f25184ef7e0698eecb295f04c1ea3bb96456d25a577eed3ba27eed831a41ae303cbc959fdf08b43fc1f43420689b0557ff95d57e53710c85cd891"
          devise_pepper_hash: "9f7b16e6c92f25184ef7e0698eecb295f04c1ea3bb96456d25a577eed3ba27eed831a41ae303cbc959fdf08b43fc1f43420689b0557ff95d57e53710c85cd891"

          encrypt_key: "caa3f43897a1c31a87598a30f9ef04f0"

          REDIS_URL: "redis://localhost:6379/1"

          content_moderation_url: "https://centralindia.api.cognitive.microsoft.com/contentmoderator/moderate/v1.0/ProcessText/Screen?autocorrect=true&PII=true&classify=True"
          content_moderation_api_key: "YOUR KEY"
        ```
8. Setup and migrate the database. In your terminal run:

    ```bash
    $ rails db:create
    $ rails db:migrate
    ```
9. Running the services:
    - Open up a new terminal to run the redis(if it's not already running), this will fireup the redis server on localhost.
    
        ```bash
        $ src/redis-server
        ```
    - We use `foreman` gem for running multiple services in just one terminal. To install it run:

        ```bash
        $ gem install foreman
        ```
    - Now we'll fire up our `rails server` on port `3002`, `webpack dev server` on port `3003` and `sidekiq` using:

        ```bash
        $ foreman start -f Procfile.dev
        ```
    - Now you can see your app running on `http://localhost:3002` or `http://YOUR_IP:PORT`

<hr class="hr-center" />



<span id="feedka-development-install-docker"></span>

## Development Install - Docker

1. For our entire tech stack, see our [GitHub repository](https://github.com/drabkirn/feedka).
2. To run the following setup, you must have `docker` and `docker-compose` install.
3. First, clone our repository and then `cd` into it:

    ```bash
    $ git clone https://github.com/drabkirn/feedka.git
    
    $ cd feedka
    ```
4. Setting up the environmental variables with Figaro:
    - Copy the `config/application-sample.yml` to `config/application.yml`

        ```bash
        $ cp config/application-sample.yml config/application.yml
        ```
    - To know the details of these environmental variables - [See Above](#feedka-dev-env)
    - Finally our `config/application.yml` file's `development` section should look something like this (Make sure `db_hostname` is set to `mysql`):

        ```yaml
        development:
          db_hostname: mysql
          db_username: root
          db_password: root
          db_name: feedka_development

          app_hostname: "localhost"
          app_port: "3000"
          app_base_domain: "http://localhost:3000"
          c_name: "ABC"
          admin_username: "abcd"
          
          mailer_from_address: "abcd@abcd.com"

          devise_secret_key: "340a68e75c7350a8cdfe7c107ce0cfda7390b7521680b2b8c6afa88f1df149eec77b4bd6700d30b814e34a3bb6362a2c5a7d4097dafada224f57d377511d483c"
          devise_pepper_hash: "2f908a14f1d8ec51fe79349fad8796a96c3321eae7ade3d5c4510250d82b45874ed7364758800a489ce503dc35e2f23dc04f560b56ed3b51d0c766770513c4f3"

          REDIS_URL: "redis://redis:6379/1"

          encrypt_key: "19c979eefc45bc4a712a6ca1e0dfacd5"

          content_moderation_url: "https://centralindia.api.cognitive.microsoft.com/contentmoderator/moderate/v1.0/ProcessText/Screen?autocorrect=true&PII=true&classify=True"
          content_moderation_api_key: "YOUR KEY"
        ```
5. We have `docker-compose.yml` and corresponding `Dockerfile` in the repo which will configure gems, redis server, MYSQL DB and webpacker. All you've to do is just run few commands:

    ```bash
    $ docker-compose build

    $ docker-compose run web rails db:setup

    $ docker-compose run web rails db:migrate

    $ docker-compose run web bundle exec rake assets:precompile

    $ docker-compose up
    ```
    - If the `docker-compose run web rails db:setup` command fails, then wait for 30 seconds and retry. This happens because `mysql` image takes little time to load.
6. Now you can see your app running on `http://localhost:3000` or `http://YOUR_IP:PORT`
    - If you want to change the port, you can do so in `docker-compose.yml` file. But for this, you'll need to do `docker-compose down` and then run `docker-compose up -d` to restart the servers.

<hr class="hr-center" />



<span id="feedka-production-install-server"></span>

## Production Install - Server

1. For our entire tech stack, see our [GitHub repository](https://github.com/drabkirn/feedka).
2. You must have Ruby version `2.7.1` and Rails `6.0.2.2` installed. You can install them using [GoRails Setup Guide](https://gorails.com/setup/ubuntu/16.04).
    - You can install Rails `6.0.2.2` with:

        ```bash
        $ gem install rails -v 6.0.2
        ```
3. We use MySQL as our database. You can install the same from DigitalOcean's [MySQL Setup Guide](https://www.digitalocean.com/community/tutorials/how-to-install-mysql-on-ubuntu-18-04)
4. You'll also need `Redis`, so you can install the same from DigitalOcean's [Redis Setup Guide](https://www.digitalocean.com/community/tutorials/how-to-install-and-secure-redis-on-ubuntu-18-04)
5. That's it, all prerequisites are now installed. Next, clone the repository and install the dependencies.

    ```bash
    $ git clone https://github.com/drabkirn/feedka.git

    $ cd feedka

    $ RAILS_ENV=prodcution bundle i
    $ RAILS_ENV=prodcution yarn install --check-files
    ```
6. Rails credentials re-setup:
    - There is a `config/credentials.yml.enc` file, but this repo doesn't have the `master.key`, so delete this file:

        ```bash
        $ rm config/credentials.yml.enc
        ```
    - Now to create your new rails credentials:

        ```bash
        $ EDITOR=nano rails credentials:edit
        ```
    - Now, press `ctrl + X`, then press `Y` and then press `Enter` to exit the `nano` editor. You don't have to change anything in your credentials, as we use `figaro` gem for our credentials. Rails credentials is only needed for `secret_key_base`.
7. Setting up the environmental variables with Figaro: <span id="feedka-prod-env"></span>
    - Copy the `config/application-sample.yml` to `config/application.yml`

        ```bash
        $ cp config/application-sample.yml config/application.yml
        ```
    - To know the details of these environmental variables - [See Above](#feedka-dev-env), but this time work on `production:` section of the `application.yml` file.
    - In addition to above environment variables, We'll add Sendgrid to send emails in production for user authentications. For for sendgrid environment variables:
    - `sendgrid_api_key`: We use sendgrid to send emails. It's free and allows upto 100 emails/day. So signup for an [sendgrid account](https://sendgrid.com/), Go to Settings --> API Keys --> Create a New Key --> Give a friendly name to your API --> Choose `Restricted Access` option --> Tick the `Mail Send` option from it(We will use sendgrid only to send mails) --> Create API. Now copy the API key and put it here. This value should be something like this `"SG.xxxxx"`
    - `sendgrid_domain`: You might have connected your domain with sendgrid to whitelist your email domain. You can use [this guide to learn more](https://sendgrid.com/docs/ui/account-and-settings/how-to-set-up-domain-authentication/). If you've not set it up, leave it blank. This value could be `"abc.com"`
    - That's it, all your environmental variables are configured. Finally, your `config/application.yml` file's `development` section must look something like this:

        ```yaml
        production:
          db_hostname: localhost
          db_username: root
          db_password: root
          db_name: feedka_development

          app_hostname: "localhost"
          app_port: "3000"
          app_base_domain: "http://localhost:3000"
          c_name: "ABC"
          admin_username: "abcd"
          
          mailer_from_address: "abcd@abcd.com"

          sendgrid_api_key: "SG.xxxx"
          sendgrid_domain: "abcd.com"

          devise_secret_key: "340a68e75c7350a8cdfe7c107ce0cfda7390b7521680b2b8c6afa88f1df149eec77b4bd6700d30b814e34a3bb6362a2c5a7d4097dafada224f57d377511d483c"
          devise_pepper_hash: "2f908a14f1d8ec51fe79349fad8796a96c3321eae7ade3d5c4510250d82b45874ed7364758800a489ce503dc35e2f23dc04f560b56ed3b51d0c766770513c4f3"

          REDIS_URL: "redis://localhost:6379/1"

          encrypt_key: "19c979eefc45bc4a712a6ca1e0dfacd5"

          content_moderation_url: "https://centralindia.api.cognitive.microsoft.com/contentmoderator/moderate/v1.0/ProcessText/Screen?autocorrect=true&PII=true&classify=True"
          content_moderation_api_key: "YOUR KEY"
        ```
8. Setup and migrate the database. So run the following commands in your terminal:

    ```bash
    $ RAILS_ENV=production rails db:create
    $ RAILS_ENV=production rails db:migrate
    ```
9. For production environment you should consider using something like [Passenger for Ruby](https://www.phusionpassenger.com/library/walkthroughs/start/ruby.html) to handle your web app requests. You can Install and setup this app easily by following Passenger documentation.
10. Also, consider getting an SSL certificate from [Lets Encrypt](https://letsencrypt.org/). You can do this using DigitalOcean's [SSL Setup for Apache](https://www.digitalocean.com/community/tutorials/how-to-secure-apache-with-let-s-encrypt-on-ubuntu-18-04) or [SSL setup for Nginx](https://www.digitalocean.com/community/tutorials/how-to-secure-nginx-with-let-s-encrypt-on-ubuntu-18-04) guide.

<hr class="hr-center" />



<span id="feedka-production-install-docker"></span>

## Production Install - Docker

1. For our entire tech stack, see our [GitHub repository](https://github.com/drabkirn/feedka).
2. To run the following setup, you must have `docker` and `docker-compose` install.
3. First, clone our repository and then `cd` into it:

    ```bash
    $ git clone https://github.com/drabkirn/feedka.git
    
    $ cd feedka
    ```
4. Setting up the environmental variables with Figaro:
    - Copy the `config/application-sample.yml` to `config/application.yml`

        ```bash
        $ cp config/application-sample.yml config/application.yml
        ```
    - To know the details of these environmental variables - [See Above](#feedka-prod-env)
    - Finally our `config/application.yml` file's `production:` section should look something like this (Make sure `db_hostname` is set to `mysql`):

        ```yaml
        production:
          db_hostname: mysql
          db_username: root
          db_password: root
          db_name: feedka_development

          app_hostname: "localhost"
          app_port: "3000"
          app_base_domain: "http://localhost:3000"
          c_name: "ABC"
          admin_username: "abcd"
          
          mailer_from_address: "abcd@abcd.com"

          sendgrid_api_key: "SG.xxxx"
          sendgrid_domain: "abcd.com"

          devise_secret_key: "340a68e75c7350a8cdfe7c107ce0cfda7390b7521680b2b8c6afa88f1df149eec77b4bd6700d30b814e34a3bb6362a2c5a7d4097dafada224f57d377511d483c"
          devise_pepper_hash: "2f908a14f1d8ec51fe79349fad8796a96c3321eae7ade3d5c4510250d82b45874ed7364758800a489ce503dc35e2f23dc04f560b56ed3b51d0c766770513c4f3"

          REDIS_URL: "redis://redis:6379/1"

          encrypt_key: "19c979eefc45bc4a712a6ca1e0dfacd5"

          content_moderation_url: "https://centralindia.api.cognitive.microsoft.com/contentmoderator/moderate/v1.0/ProcessText/Screen?autocorrect=true&PII=true&classify=True"
          content_moderation_api_key: "YOUR KEY"
        ```
5. We have `docker-compose-production.yml` and corresponding `Dockerfile_production` in the repo which will configure gems, redis server, MYSQL DB and webpacker. All you've to do is just run few commands:

    ```bash
    $ docker-compose build

    $ docker-compose run web rails db:setup

    $ docker-compose run web rails db:migrate

    $ docker-compose run web bundle exec rake assets:precompile

    $ docker-compose up
    ```
    - If the `docker-compose run web rails db:setup` command fails, then wait for 30 seconds and retry. This happens because `mysql` image takes little time to load.
6. Now you can see your app running on `http://localhost:3000` or `http://YOUR_IP:PORT`
    - If you want to change the port, you can do so in `docker-compose.yml` file. But for this, you'll need to do `docker-compose down` and then run `docker-compose up -d` to restart the servers.