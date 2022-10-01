import React, { useEffect, useState } from 'react';
import { Inertia } from "@inertiajs/inertia";
import { Modal } from "reactstrap";
import CardFormModal from "../../../shared/CardFormModal";
import useErrors from "../../../shared/useErrors";
import { withScope } from "../../../shared/i18n";
import IngredientForm from "../forms/IngredientForm";

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
      }, {preserveState: true});
    } else if(type === "edit") {
      Inertia.put(`/projects/${projectId}/posts/${postId}/ingredients/${ingredient.id}`, {
        ingredient: ingredientValues
      }, {preserveState: true});
    }
  }

  function handleChange(update) {
    setIngredientValues(update)
  }

  return ( 
    <div>
      <Modal isOpen={isOpen} size="lg" toggle={() => toggleModal()} backdrop="static">
        <CardFormModal onSubmit={handleSubmit} title={type === 'create' ? "Shto perberes te ri" : "Edito perberesin"}  errors={useErrors('ingredient')} toggleModal={toggleModal}>
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
