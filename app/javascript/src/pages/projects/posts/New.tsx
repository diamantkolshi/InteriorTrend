import React, { useState } from 'react';
import { Inertia } from "@inertiajs/inertia";
import {
  Col,
  CustomInput,
  Input,
  Row
} from 'reactstrap';

import useErrors from "../../../shared/useErrors";
import CardForm from "../../../shared/CardForm";
import { withScope } from "../../../shared/i18n";
import ProjectLayout from "../Layout";
import PostForm from "../forms/PostForm";

const ttable = withScope('helpers', 'project', 'index', 'table');

const New = ({project, posts, post}) => {
  const [postValue, setProjectValues] = useState(project);

  function handleSubmit() {
  }

  function handleChange(update) {
    setProjectValues(update);
  }

  return (
    <ProjectLayout project={project} posts={posts}> 
      <Row>
        <Col xl={12}>
          <CardForm onSubmit={handleSubmit} title={"Shto postim te ri"} errors={useErrors('project')}>
            <PostForm
              post={{}}
              onChange={handleChange}
            />
          </CardForm>
        </Col>
      </Row> 
    </ProjectLayout>
  )
}

export default New;
