import { func } from 'prop-types';
import React, { useEffect, useState } from 'react';

const ImageDislay = ({imageUrl, ingredients, openModal, openEditModal}) => {
  const [displayPoint, setDisplayPoint] = useState('none');
  const [displayInfoId, setDisplayInfoId] = useState(null);
  const [pointX, setPointX] = useState(null);
  const [pointY, setPointY] = useState(null);

  const handleClick = (e) => {
    const rect = e.currentTarget.getBoundingClientRect();
    const x = e.clientX - (rect.left + 4);
    const y = e.clientY - (rect.top + 4);
    
    const percentX = (x/rect.width) * 100
    const percentY = (y/rect.height) * 100

    openModal(
      {
        pointX: percentX.toFixed(2), 
        pointY: percentY.toFixed(2), 
        width: rect.width.toFixed(2), 
        height: rect.height.toFixed(2)
      }
    )
    
    setPointX(percentX);
    setPointY(percentY)
    setDisplayPoint('block');
  }

  function displayExistIngredient() {
    return (
      ingredients.map((ingredient) => displayPointIcon('block', ingredient.position_x, ingredient.position_y, ingredient))
    )
  }

  function openIngredientModal(ingredientId) {
    openEditModal(ingredientId)
  }

  function displayTooltipInfo(integrationId) {
    setDisplayInfoId(integrationId)
  }

  function removeTooltipInfo() {
    setDisplayInfoId(null)
  }

  function displayPointIcon(isShow, x, y, ingredient=null) {
    var info = 'none'
    var id = null
    if(ingredient !== null) {
      info = displayInfoId == ingredient.id && ingredient.id != null ? 'block' : 'none';
      id = ingredient.id
    } else {
      return
    }
    
    return (
      <>
        <i className="fas fa-tag" 
          style={{
            display: `${isShow}`,
            position: 'absolute', 
            top: `${y}%`,
            left: `${x}%`,
            color: 'red',
            fontSize: 22,
            animation: 'orgin 5s linear infinite',
            cursor: 'pointer'
          }}
          onClick={() => openIngredientModal(id)}
          onMouseEnter={() => displayTooltipInfo(id)}
          onMouseLeave={() => removeTooltipInfo()}
        />
        <div style={{
          display: `${info}`,
          position: 'absolute',
          top: `${parseFloat(y) + 7}%`,
          left: `${parseFloat(x) - 1}%`,
          backgroundColor: '#fff',
          padding: 15,
          borderRadius: 5,
          lineHeight: 0.6
        }}>
          <div style={{position: 'absolute', width: 12, height: 12, backgroundColor: '#fff', top: -6, left: 15,  transform: 'rotate(45deg)'}}></div>
          <p style={{fontSize: 14}}>Name: <span style={{fontSize: 12}}>{ingredient.name}</span></p>
          <p style={{fontSize: 14}}>Price: <span style={{fontSize: 12}}>{ingredient.price} EUR</span></p>
        </div>
      </>
    )
  }

  return (
    <>
      <img onClick={handleClick} src={imageUrl} alt="Alt text" style={{margin: 0, width: '100%', height:"100%", borderRadius: 5}} />
      {displayExistIngredient()}
      {displayPointIcon(displayPoint, pointX, pointY)}
    </>
  )
};

export default ImageDislay;
