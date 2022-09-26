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

const Edit = ({project, posts, post, ingredients, ingredient}) => {
  const closeIngredientModal = () => {
    Inertia.visit(`/projects/${project.id}/posts/${post.id}/edit`, {preserveScroll: true})
  }

  const openIngredientModal = ({pointX, pointY, width, height}) => {
    Inertia.visit(`/projects/${project.id}/posts/${post.id}/ingredients/new`, 
      { 
        data: { position_x: pointX, position_y: pointY, width, height }, 
        preserveState: true
      }
    );
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
              ingredients={ingredients}
              onChange={handleChange}
              openModal={openIngredientModal}
            />
          </CardForm>
        </Col>
      </Row> 
      <Ingredient   
        ingredient={ingredient} 
        isOpen={!!ingredient} 
        toggleModal={closeIngredientModal}
        projectId={project.id}
        postId={post.id} 
      />
    </ProjectLayout>
  )
}

export default Edit;
