import React, { useState, useEffect } from 'react';
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

const Edit = ({project, posts, post, ingredients, ingredient, type}) => {
  const [ postValue, setPostValue ] = useState(post) 

  useEffect(() => {
    setPostValue(post)
  }, [post])

  const closeIngredientModal = () => {
    Inertia.visit(`/projects/${project.id}/posts/${post.id}/edit`, {preserveScroll: true, preserveState: true})
  }

  const openIngredientModal = ({pointX, pointY, width, height}) => {
    Inertia.visit(`/projects/${project.id}/posts/${post.id}/ingredients/new`, 
      { 
        data: { position_x: pointX, position_y: pointY, width, height }, 
        preserveScroll: true,
        preserveState: true
      }
    );
  }

  const openEditIngredientModal = (ingredientId) => {
    Inertia.visit(`/projects/${project.id}/posts/${post.id}/ingredients/${ingredientId}/edit`, {preserveScroll: true})
  }

  function handleSubmit() {
  }

  function handleChange(update) {
    setPostValue(update)
  }

  return (
    <ProjectLayout project={project} posts={posts}> 
      <Row>
        <Col xl={12}>
          <CardForm onSubmit={handleSubmit} title={"Edito postimin"} errors={useErrors('project')}>
            <PostForm
              post={postValue}
              ingredients={ingredients}
              onChange={handleChange}
              openModal={openIngredientModal}
              openEditModal={openEditIngredientModal}
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
        type={type || ''}
      />
    </ProjectLayout>
  )
}

export default Edit;
