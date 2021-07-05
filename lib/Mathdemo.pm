package Mathdemo;
use Mojo::Base 'Mojolicious', -signatures;

# This method will run once at server start
sub startup ($self) {
  $self->app->log->debug("Loading Server");

  # Load configuration from config file
  my $config = $self->plugin('NotYAMLConfig');

  $self->plugin(
    'OpenAPI',
    url    => $self->app->home->child('api')->child('mathdemo-api.yml')->to_string,
    schema => 'v3'
  );
}

1;
