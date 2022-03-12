import React from 'react';
import { Inertia } from "@inertiajs/inertia";
import { Container } from "@material-ui/core";
import { Button, ButtonGroup } from "@material-ui/core";
import { TextField } from "@material-ui/core";
import { Paper, Box } from "@material-ui/core";

const InertiaExample = ({name}) => {
  return (
    <>
      <h1>Hello {name}!</h1>
    </>
  )
}

export default InertiaExample;
