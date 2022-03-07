module.exports = ({ env }) => ({
  auth: {
    secret: env('ADMIN_JWT_SECRET', '97ac853bad221146df41d7af0cf08fb6'),
  },
});
