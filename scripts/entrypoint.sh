#!/usr/bin/env bash
bin/rails db:create db:migrate db:seed
bin/rails server -b 0.0.0.0