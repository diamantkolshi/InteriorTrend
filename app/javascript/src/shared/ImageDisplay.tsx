import React, { useEffect, useState } from 'react';

const ImageDislay = ({imageUrl, ingredients, openModal}) => {
  const [displayPoint, setDisplayPoint] = useState('none');
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
      ingredients.map(({position_x, position_y}) => displayPointIcon('block', position_x, position_y))
    )
  }

  function displayPointIcon(isShow, x, y) {
    return (
      <i className="fas fa-tag" 
        style={{
          display: `${isShow}`,
          position: 'absolute', 
          top: `${y}%`,
          left: `${x}%`,
          color: 'red',
          fontSize: 22,
          animation: 'orgin 5s linear infinite'
        }}
      />
    )
  }

  return (
    <>
      <img onClick={handleClick} src={imageUrl} alt="Alt text" style={{margin: 0, width: '100%', height:"100%"}} />
      {displayExistIngredient()}
      {displayPointIcon(displayPoint, pointX, pointY)}
    </>
  )
};

export default ImageDislay;
