import React, { useEffect, useState } from 'react';

const ImageDislay = ({imageUrl}) => {
  const [displayPoint, setDisplayPoint] = useState('none');
  const [pointX, setPointX] = useState(null);
  const [pointY, setPointY] = useState(null);

  const handleClick = (e) => {
    const rect = e.currentTarget.getBoundingClientRect();
    const x = e.clientX - (rect.left + 10);
    const y = e.clientY - (rect.top + 10);

    const percentX = (x/rect.width) * 100
    const percentY = (y/rect.height) * 100
    
    setPointX(percentX);
    setPointY(percentY)
    setDisplayPoint('block');
  }

  return (
    <>
      <img onClick={handleClick} src={imageUrl} alt="Alt text" style={{margin: 0, width: '100%', height:"100%"}} />
      <div
        style={{
          display: displayPoint,
          position: 'absolute', 
          width: 20, 
          height: 20,
          borderRadius: 10,
          top: pointY + '%',
          left: pointX + '%',
          backgroundColor: 'red'
        }}
      ></div>
    </>
  )
};

export default ImageDislay;
