import React, { useEffect, useState } from 'react';
import { Inertia } from "@inertiajs/inertia";
import { Modal } from "reactstrap";
import CardFormModal from "../../../shared/CardFormModal";
import useErrors from "../../../shared/useErrors";
import { withScope } from "../../../shared/i18n";
import IngredientForm from "../forms/IngredientForm";
import { func } from 'prop-types';

const ttable = withScope('helpers', 'project', 'new', 'table');

const Ingredient = ({ingredient, isOpen, toggleModal, projectId, postId, type}) => {
  const [ingredientValues, setIngredientValues] = useState(ingredient);

  useEffect(() => {
    setIngredientValues(ingredient)
  }, [ingredient])

  function handleSubmit() {
    if(type === "create") {
      Inertia.post(`/projects/${projectId}/posts/${postId}/ingredients`, {
        ingredient: ingredientValues
      }, {preserveState: true, preserveScroll: true});
    } else if(type === "edit") {
      Inertia.put(`/projects/${projectId}/posts/${postId}/ingredients/${ingredient.id}`, {
        ingredient: ingredientValues
      }, {preserveState: true, preserveScroll: true});
    }
  }

  function handleChange(update) {
    setIngredientValues(update)
  }

  function handleDelete() {
    const r = window.confirm("Are you sure?");
    if (r === true) {
        Inertia.delete(`/projects/${projectId}/posts/${postId}/ingredients/${ingredient.id}`, {preserveScroll: true});
    }
  }

  return ( 
    <div>
      <Modal isOpen={isOpen} size="lg" toggle={() => toggleModal()} backdrop="static">
        <CardFormModal onSubmit={handleSubmit} onDelete={type === 'create' ? null : handleDelete} title={type === 'create' ? "Shto perberes te ri" : "Edito perberesin"}  errors={useErrors('ingredient')} toggleModal={toggleModal}>
          <IngredientForm
            ingredient={ingredientValues}
            onChange={handleChange}
          />
        </CardFormModal>
      </Modal>
    </div>
  )
}

export default Ingredient;
