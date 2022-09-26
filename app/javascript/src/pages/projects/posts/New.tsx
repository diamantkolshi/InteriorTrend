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

const New = ({project, posts, post, ingredient}) => {
  const [ingredients, setIngredients] = useState([]);
  const [ingredientModal, setIngredientModal] = useState(false);

  const closeIngredientModal = () => {
    setIngredientModal(false)
    // Inertia.visit(`/projects/new`, {preserveScroll: true})
  }

  const openIngredientModal = () => {
    setIngredientModal(true)
    // Inertia.visit(`/projects/new`, {preserveScroll: true})
  }


  function handleSubmit() {
  }

  function handleChange(update) {
  }

  return (
    <ProjectLayout project={project} posts={posts}> 
    </ProjectLayout>
  )
}

export default New;
