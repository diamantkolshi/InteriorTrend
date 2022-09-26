import React, { useEffect, useState } from 'react';

const ImageDislay = ({imageUrl, openModal}) => {
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

  return (
    <>
      <img onClick={handleClick} src={imageUrl} alt="Alt text" style={{margin: 0, width: '100%', height:"100%"}} />
      <i className="fas fa-tag" 
        style={{
          display: displayPoint,
          position: 'absolute', 
          top: pointY + '%',
          left: pointX + '%',
          color: 'red',
          fontSize: 22,
          animation: 'orgin 5s linear infinite'
        }}
      />
    </>
  )
};

export default ImageDislay;
