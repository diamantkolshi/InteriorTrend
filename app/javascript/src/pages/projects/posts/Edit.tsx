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
import Ingredient from "./Ingredient"

const ttable = withScope('helpers', 'project', 'index', 'table');

const Edit = ({project, posts, post, ingredient}) => {
  const [ingredients, setIngredients] = useState([]);
  const [ingredientModal, setIngredientModal] = useState(false);

  const closeIngredientModal = () => {
    Inertia.visit(`/projects/${project.id}/posts/${post.id}/edit`, {preserveScroll: true})
  }

  const openIngredientModal = () => {
    Inertia.visit(`/projects/${project.id}/posts/${post.id}/ingredients/new`, {preserveScroll: true})
  }

  function handleSubmit() {
  }

  function handleChange(update) {
  }

  return (
    <ProjectLayout project={project} posts={posts}> 
      <Row>
        <Col xl={12}>
          <CardForm onSubmit={handleSubmit} title={"Edito postimin"} errors={useErrors('project')}>
            <PostForm
              post={post}
              onChange={handleChange}
              openModal={openIngredientModal}
            />
          </CardForm>
        </Col>
      </Row> 
      <Ingredient ingredient={ingredient} isOpen={!!ingredient} toggleModal={closeIngredientModal} />
    </ProjectLayout>
  )
}

export default Edit;
