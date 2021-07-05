package Mathdemo::Controller::Expression;
use Mojo::Base 'Mojolicious::Controller', -signatures;

use HTTP::Status qw(:constants);
use Math::Expression;

use experimental qw(postderef);

sub echo ($self) {
  return unless $self->openapi->valid_input;

  my $expression = $self->validation->param('expression');

  return $self->render(
    openapi => {
      expression => $expression
    }
  );
}

sub evaluate ($self) {
  return unless $self->openapi->valid_input;

  my $expression = $self->req->json->{expression};

  my $math = Math::Expression->new();
  my $t    = $math->Parse($expression);

  return $self->render(
    openapi => {
      given  => {expression => $expression},
      result => $math->EvalToScalar($t)
    }
  );
}

1;
