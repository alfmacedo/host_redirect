# HostRedirect

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'host_redirect', git: 'https://github.com/alfml/host_redirect.git'
```

## Usage

In production.rb or development.rb
```ruby
config.middleware.use HostRedirect::Run, {
      # IMPORTANT: Include http: o https:
      host_authorized: 'https://ruc.com.pe'
}
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/alfml/host_redirect.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the HostRedirect project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/host_redirect/blob/master/CODE_OF_CONDUCT.md).
