const generateAlphabet = () => {
  const alphabet = []
  // 0x0020 .. 0x007f latin
  // 0x00a0 .. 0x00ff latin 1 supplement
  // 0x0100 .. 0x017f latin extended-a
  // 0x0180 .. 0x024f latin extended-b
  //
  for (let i = 0x0020; i < 0x024f; i++) {
    if (i > 0x0079 && i < 0x00a0) continue // exclude some chars
    alphabet.push(String.fromCharCode(i))
  }

  const upper = alphabet.map(s => s.toUpperCase())
  const lower = alphabet.map(s => s.toLowerCase())
  const visited = new Set()

  const aUpper = []
  const aLower = []
  const outToUpper = []
  const outToLower = []

  for (let i = 0; i < alphabet.length; i++) {
    const cUpper = upper[i]
    const cLower = lower[i]
    if (cUpper !== cLower && !visited.has(cUpper)) {
      aUpper.push(cUpper)
      aLower.push(cLower)
      outToUpper.push(`s/${cLower}/${cUpper}/g;`)
      outToLower.push(`s/${cUpper}/${cLower}/g;`)
      visited.add(cUpper)
    }
  }

  console.log(`to_lower_case () {
    sed '${outToLower.join('')}'
  }
  `)
  console.log(`to_upper_case () {
    sed '${outToUpper.join('')}'
  }
  `)
}

generateAlphabet()
